export const authenticated = ({ req }: { req: { user?: unknown } }) => {
  return Boolean(req?.user)
}

