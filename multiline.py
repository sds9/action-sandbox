import os

output = """
\`\`\`bash
line1
line2
line3
\`\`\`
"""

with open(os.getenv('GITHUB_OUTPUT'), 'a') as f:
  f.write(f"output<<EOF\n{output}\nEOF\n")