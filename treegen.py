import os, sys

EXCLUDE = {"__pycache__", "migrations", "staticfiles", ".git", "venv", "env", "admin"}

# Force stdout to UTF-8
sys.stdout.reconfigure(encoding='utf-8')

def print_tree(start_path, prefix=""):
    try:
        contents = sorted(os.listdir(start_path))
    except PermissionError:
        return
    contents = [c for c in contents if c not in EXCLUDE]
    for i, name in enumerate(contents):
        path = os.path.join(start_path, name)
        connector = "└── " if i == len(contents) - 1 else "├── "
        print(prefix + connector + name)
        if os.path.isdir(path):
            extension = "    " if i == len(contents) - 1 else "│   "
            print_tree(path, prefix + extension)

print_tree(".")
