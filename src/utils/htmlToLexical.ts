import { createHeadlessEditor } from '@lexical/headless'
import { $generateNodesFromDOM } from '@lexical/html'
import { HeadingNode, QuoteNode, ParagraphNode } from '@lexical/rich-text'
import { ListItemNode, ListNode } from '@lexical/list'
import { LinkNode } from '@lexical/link'
import { CodeNode } from '@lexical/code'
import { TableCellNode, TableNode, TableRowNode } from '@lexical/table'
import { $getRoot } from 'lexical'
import { JSDOM } from 'jsdom'

export async function htmlToLexicalState(html: string): Promise<unknown> {
  const editor = createHeadlessEditor({
    namespace: 'import-html',
    nodes: [
      HeadingNode,
      ParagraphNode,
      QuoteNode,
      ListNode,
      ListItemNode,
      LinkNode,
      CodeNode,
      TableNode,
      TableRowNode,
      TableCellNode,
    ],
    onError: () => void 0,
  })

  const dom = new JSDOM(`<!doctype html><html><body>${html}</body></html>`)

  editor.update(() => {
    const nodes = $generateNodesFromDOM(editor, dom.window.document)
    const root = $getRoot()
    root.clear()
    nodes.forEach((n) => root.append(n))
  })

  return editor.getEditorState().toJSON()
}
