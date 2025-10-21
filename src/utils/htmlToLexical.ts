import { createHeadlessEditor } from '@payloadcms/richtext-lexical'
import { $generateNodesFromDOM } from '@lexical/html'
import { HeadingNode, QuoteNode } from '@lexical/rich-text'
import { ParagraphNode, $createParagraphNode, $createTextNode, $getRoot } from 'lexical'
import { ListItemNode, ListNode } from '@lexical/list'
import { LinkNode, AutoLinkNode } from '@lexical/link'
import { CodeNode } from '@lexical/code'
import { TableCellNode, TableNode, TableRowNode } from '@lexical/table'
import { HorizontalRuleNode } from '@lexical/react/LexicalHorizontalRuleNode'
import { JSDOM } from 'jsdom'

export async function htmlToLexicalState(html: string): Promise<any> {
  const editor = createHeadlessEditor({
    namespace: 'import-html',
    nodes: [
      HeadingNode, ParagraphNode, QuoteNode,
      ListNode, ListItemNode,
      LinkNode, AutoLinkNode,
      CodeNode, HorizontalRuleNode,
      TableNode, TableRowNode, TableCellNode,
    ],
    onError: () => void 0,
  })

  const dom = new JSDOM(`<!doctype html><html><body><div id="root">${html}</div></body></html>`)
  const container = dom.window.document.getElementById('root')!

  editor.update(() => {
    const root = $getRoot()
    root.clear()

    const nodes = $generateNodesFromDOM(editor, container)

    const filtered = nodes.filter((n: any) => {
      try {
        if (n.getType?.() === 'paragraph') {
          const text = n.getTextContent?.() ?? ''
          return text.trim().length > 0 || n.getChildrenSize?.() > 0
        }
      } catch {}
      return true
    })

    if (filtered.length === 0) {
      const p = $createParagraphNode()
      p.append($createTextNode(''))
      root.append(p)
    } else {
      filtered.forEach(n => root.append(n))
    }
  })

  return editor.getEditorState().toJSON()
}
