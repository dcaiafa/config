def dfs(root, search):
  pending = [(root, 'root', None)]
  while pending:
    node = pending.pop()
    node_value, node_key, _ = node

    if isinstance(node_value, dict):
      for key, value in node_value.iteritems():
        pending.append((value, key, node))
    elif isinstance(node_value, list):
      for i in range(len(node_value)):
        value = node_value[i]
        pending.append((value, ('[%d]' % i), node))
    elif isinstance(node_value, (int, str)):
      if search in str(node_value):
        _printDfsPath(node)
        break

def _printDfsPath(node):
  value, key, parent = node
  print key
  if parent:
    _printDfsPath(parent)

