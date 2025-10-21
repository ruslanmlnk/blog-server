import { createHeadlessEditor } from '@lexical/headless'
import { $generateNodesFromDOM } from '@lexical/html'
import { HeadingNode, QuoteNode } from '@lexical/rich-text'
import { ParagraphNode, $createParagraphNode, $createTextNode, $getRoot } from 'lexical'
import { ListItemNode, ListNode } from '@lexical/list'
import { LinkNode } from '@lexical/link'
import { CodeNode } from '@lexical/code'
import { TableCellNode, TableNode, TableRowNode } from '@lexical/table'
// $getRoot re-exported above
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
    if (root.getChildrenSize() === 0) {
      const p = $createParagraphNode()
      // push an empty text node to avoid empty editor state
      p.append($createTextNode(''))
      root.append(p)
    }
  })

  return editor.getEditorState().toJSON()
}
