// src/utils/htmlToLexical.ts
import { JSDOM } from 'jsdom'

/* ============ helpers to build lexical nodes ============ */

// форматні біти Lexical
const F_BOLD = 1;
const F_ITALIC = 2;
const F_UNDERLINE = 8;
const F_STRIKE = 16;

// створює текстовий вузол з форматами та (за потреби) style
function makeText(text: string, format = 0, style?: string) {
  return {
    type: 'text',
    version: 1,
    text,
    detail: 0,
    format,           // <-- тепер використовуємо біти
    mode: 'normal',
    style: style ?? '', // напр., 'font-size: 18px;'
  }
}


function makeParagraph(children: any[]) {
  return {
    type: 'paragraph',
    version: 1,
    format: '',
    indent: 0,
    direction: 'ltr',
    children,
  }
}

function makeLink(href: string, children: any[]) {
  const ok = /^https?:\/\//i.test(href) || /^mailto:/i.test(href) || /^tel:/i.test(href)
  if (!ok) {
    const t = href ? href : ''
    return children?.length ? { ...makeParagraph(children) } : makeParagraph(t ? [makeText(t)] : [])
  }
  return {
    type: 'link',
    version: 1,
    format: '',
    indent: 0,
    direction: 'ltr',
    fields: {
      url: href,
      newTab: false,
    },
    children,
  }
}

function makeHeading(tag: string, children: any[]) {
  const t = String(tag).toLowerCase()
  const allowed = new Set(['h1', 'h2', 'h3', 'h4', 'h5', 'h6'])
  return {
    type: 'heading',
    version: 1,
    format: '',
    indent: 0,
    direction: 'ltr',
    tag: allowed.has(t) ? t : 'h2',
    children,
  }
}

function makeListItem(children: any[]) {
  return {
    type: 'listitem',
    version: 1,
    value: 1,
    format: '',
    indent: 0,
    direction: 'ltr',
    children,
  }
}

function makeList(tag: 'ul' | 'ol', children: any[]) {
  return {
    type: 'list',
    version: 1,
    tag,
    listType: tag === 'ol' ? 'number' : 'bullet',
    start: 1,
    format: '',
    indent: 0,
    direction: 'ltr',
    children,
  }
}

// table family
function makeTable(children: any[]) {
  return {
    type: 'table',
    version: 1,
    format: '',
    indent: 0,
    direction: 'ltr',
    children, // tablerow[]
  }
}

function makeTableRow(children: any[]) {
  return {
    type: 'tablerow',
    version: 1,
    format: '',
    indent: 0,
    direction: 'ltr',
    children, // tablecell[]
  }
}

function makeTableCell(opts: {
  header?: boolean
  colSpan?: number
  rowSpan?: number
  backgroundColor?: string | null
  children?: any[]
}) {
  return {
    type: 'tablecell',
    version: 1,
    format: '',
    indent: 0,
    direction: 'ltr',
    headerState: opts.header ? 1 : 0,
    colSpan: opts.colSpan && opts.colSpan > 1 ? opts.colSpan : 1,
    rowSpan: opts.rowSpan && opts.rowSpan > 1 ? opts.rowSpan : 1,
    backgroundColor: opts.backgroundColor ?? null,
    children: opts.children ?? [makeParagraph([makeText('')])],
  }
}

function norm(s: string) {
  return s.replace(/\s+/g, ' ').trim()
}

/* ============ inline parsing ============ */

// зчитуємо стилі елемента й повертаємо: {formatDelta, fontSize}
function pickInlineStyle(el: Element): { fmt: number; fontSize?: string; underline?: boolean; strike?: boolean; bold?: boolean; italic?: boolean } {
  let fmt = 0
  const style = (el.getAttribute('style') || '').toLowerCase()

  if (/font-weight\s*:\s*(bold|[7-9]00)/.test(style)) fmt |= F_BOLD
  if (/font-style\s*:\s*italic/.test(style)) fmt |= F_ITALIC
  const underline = /text-decoration[^;]*:\s*[^;]*underline/.test(style)
  const strike = /text-decoration[^;]*:\s*[^;]*(line-through|strike)/.test(style)
  if (underline) fmt |= F_UNDERLINE
  if (strike) fmt |= F_STRIKE

  const m = /font-size\s*:\s*([^;]+)/.exec(style)
  const fontSize = m?.[1]?.trim()

  return { fmt, fontSize, underline, strike }
}

/**
 * Рекурсивно будує інлайни, **успадковуючи формат** (bold/italic/underline/strike)
 * і передаючи font-size у text.style
 */
function parseInline(el: Element, inheritedFmt = 0, inheritedFontSize?: string): any[] {
  const result: any[] = []

  ;[...el.childNodes].forEach((node) => {
    if (node.nodeType === 3) {
      const text = (node.textContent || '').replace(/\s+/g, ' ').trim()
      if (text) result.push(makeText(text, inheritedFmt, inheritedFontSize ? `font-size: ${inheritedFontSize};` : undefined))
      return
    }

    if (node.nodeType === 1) {
      const e = node as Element
      const tag = e.tagName.toLowerCase()

      // обчислюємо формат для цього рівня
      let fmt = inheritedFmt
      if (tag === 'b' || tag === 'strong') fmt |= F_BOLD
      if (tag === 'i' || tag === 'em') fmt |= F_ITALIC
      if (tag === 'u') fmt |= F_UNDERLINE
      if (tag === 's' || tag === 'strike' || tag === 'del') fmt |= F_STRIKE

      const styleInfo = pickInlineStyle(e)
      fmt |= styleInfo.fmt
      const fontSize = styleInfo.fontSize ?? inheritedFontSize

      if (tag === 'a') {
        const href = e.getAttribute('href') || ''
        const kids = parseInline(e, fmt, fontSize)
        const fallback = (e.textContent || '').trim()
        const linkChildren = kids.length ? kids : (fallback ? [makeText(fallback, fmt, fontSize ? `font-size: ${fontSize};` : undefined)] : [])

        // Only create link node for safe, absolute URLs or allowed schemes
        const ok = /^https?:\/\//i.test(href) || /^mailto:/i.test(href) || /^tel:/i.test(href)
        if (!ok) {
          // Degrade to plain inline content to avoid invalid link validation errors
          if (linkChildren.length) result.push(...linkChildren)
          return
        }

        result.push({
          type: 'link',
          version: 1,
          format: '',
          indent: 0,
          direction: 'ltr',
          fields: { url: href, newTab: false },
          children: linkChildren,
        })
        return
      }

      // блокові елементи в інлайні ігноруємо
      if (tag === 'ul' || tag === 'ol' || tag === 'li' || tag === 'p' || tag.startsWith('h') || tag === 'table' || tag === 'tr' || tag === 'td' || tag === 'th') {
        return
      }

      // інші інлайни — рекурсивно
      const kids = parseInline(e, fmt, fontSize)
      if (kids.length) result.push(...kids)
    }
  })

  return result
}


/* ============ list parsing with nesting ============ */

function parseLi(li: Element): any {
  const inline = parseInline(li)
  const children: any[] = inline.length ? [makeParagraph(inline)] : []

  const nested = Array.from(li.children).find((c) => {
    const t = c.tagName?.toLowerCase()
    return t === 'ul' || t === 'ol'
  }) as Element | undefined

  if (nested) {
    const n = parseList(nested)
    if (n) children.push(n)
  }

  return makeListItem(children.length ? children : [makeParagraph([makeText('')])])
}

function parseList(listEl: Element): any | null {
  const tag = listEl.tagName.toLowerCase()
  if (tag !== 'ul' && tag !== 'ol') return null
  const items: any[] = []
  ;[...listEl.children].forEach((child) => {
    if (child.tagName?.toLowerCase() === 'li') {
      items.push(parseLi(child))
    }
  })
  return makeList(tag as 'ul' | 'ol', items)
}

/* ====== heuristics to avoid Mammoth “double-lists” ====== */

function directLiTexts(listEl: Element): string[] {
  const out: string[] = []
  ;[...listEl.children].forEach((child) => {
    if (child.tagName?.toLowerCase() !== 'li') return
    let text = ''
    ;[...child.childNodes].forEach((n) => {
      if (n.nodeType === 3) text += n.textContent || ''
      else if ((n as Element).tagName) {
        const t = (n as Element).tagName.toLowerCase()
        if (t !== 'ul' && t !== 'ol') text += (n as Element).textContent || ''
      }
    })
    const normalized = norm(text)
    if (normalized) out.push(normalized)
  })
  return out
}

function nestedListIfSingleLi(listEl: Element): Element | null {
  const lis = Array.from(listEl.querySelectorAll(':scope > li'))
  if (lis.length !== 1) return null
  const li = lis[0]
  const nested = Array.from(li.children).find((c) => {
    const t = c.tagName?.toLowerCase()
    return t === 'ul' || t === 'ol'
  }) as Element | undefined
  return nested || null
}

/* ============ table parsing ============ */



function parseTableCell(cellEl: Element): any {
  const tag = cellEl.tagName.toLowerCase()
  const header = tag === 'th'
  const colSpan = parseInt(cellEl.getAttribute('colspan') || '1', 10) || 1
  const rowSpan = parseInt(cellEl.getAttribute('rowspan') || '1', 10) || 1

  // інлайновий фон (не обов'язково)
  let backgroundColor: string | null = null
  const styleAttr = cellEl.getAttribute('style') || ''
  const m = /background-color\s*:\s*([^;]+)\s*;?/i.exec(styleAttr)
  if (m?.[1]) backgroundColor = m[1].trim()

  const children: any[] = []

  // 1) Параграфи в клітинці: беремо тільки ПРЯМІ <p>
  const directPs = Array.from(cellEl.querySelectorAll(':scope > p'))
  if (directPs.length) {
    for (const p of directPs) {
      const inlines = parseInline(p)
      children.push(makeParagraph(inlines.length ? inlines : [makeText('')]))
    }
  }

  // 2) Прямі списки в клітинці: <ul>/<ol> як окремі ноди після параграфів
  const directLists = Array.from(cellEl.querySelectorAll(':scope > ul, :scope > ol'))
  for (const l of directLists) {
    const listNode = parseList(l)
    if (listNode) children.push(listNode)
  }

  // 3) Якщо ні <p>, ні списків — беремо інлайни напряму з <td>
  if (children.length === 0) {
    const inlines = parseInline(cellEl)
    children.push(makeParagraph(inlines.length ? inlines : [makeText('')]))
  }

  return makeTableCell({
    header,
    colSpan,
    rowSpan,
    backgroundColor,
    children,
  })
}

function parseTableRow(trEl: Element): any {
  const cells: any[] = []
  ;[...trEl.children].forEach((c) => {
    const tag = c.tagName?.toLowerCase()
    if (tag === 'td' || tag === 'th') {
      cells.push(parseTableCell(c))
    }
  })
  return makeTableRow(cells)
}

function parseTable(tableEl: Element): any {
  const rows: any[] = []
  const candidates = tableEl.querySelectorAll(':scope > tbody > tr, :scope > thead > tr, :scope > tr')
  candidates.forEach((tr) => rows.push(parseTableRow(tr)))
  return makeTable(rows)
}

/* ============ block parsing & top-level iteration ============ */

function parseBlock(el: Element): any | null {
  const tag = el.tagName.toLowerCase()
  if (['h1','h2','h3','h4','h5','h6'].includes(tag)) {
    const inline = parseInline(el)
    return makeHeading(tag, inline.length ? inline : [makeText('')])
  }
  if (tag === 'p') {
    const inline = parseInline(el)
    return makeParagraph(inline.length ? inline : [makeText('')])
  }
  if (tag === 'ul' || tag === 'ol') {
    return parseList(el)
  }
  if (tag === 'table') {
    return parseTable(el)
  }
  const t = norm(el.textContent || '')
  if (t) return makeParagraph([makeText(t)])
  return null
}

export async function htmlToLexicalState(html: string): Promise<unknown> {
  const dom = new JSDOM(`<!doctype html><html><body>${html}</body></html>`)
  const { document } = dom.window

  const allowed = new Set(['h1','h2','h3','h4','h5','h6','p','ul','ol','table'])
  const topBlocks: Element[] = []
  Array.from(document.body.children).forEach((el) => {
    if (allowed.has(el.tagName.toLowerCase())) topBlocks.push(el)
  })

  const resultChildren: any[] = []

  for (let i = 0; i < topBlocks.length; i++) {
    const el = topBlocks[i]
    const tag = el.tagName.toLowerCase()

    if ((tag === 'ul' || tag === 'ol') && i + 1 < topBlocks.length) {
      const nested = nestedListIfSingleLi(el)
      const next = topBlocks[i + 1]
      const nextTag = next.tagName.toLowerCase()
      if (nested && (nextTag === 'ul' || nextTag === 'ol')) {
        const a = directLiTexts(nested)
        const b = directLiTexts(next)
        if (a.length && b.length && a.length === b.length && a.every((t, idx) => t === b[idx])) {
          const node = parseBlock(el)
          if (node) resultChildren.push(node)
          i += 1
          continue
        }
      }
    }

    const node = parseBlock(el)
    if (node) resultChildren.push(node)
  }

  if (resultChildren.length === 0) {
    resultChildren.push(makeParagraph([makeText('')]))
  }

  const json = {
    root: {
      type: 'root',
      version: 1,
      format: '',
      indent: 0,
      direction: 'ltr',
      children: resultChildren,
    },
  }

  try {
    console.log('[htmlToLexicalState] built types:', json.root.children.map((c: any) => c.type))
  } catch {}

  return json
}
