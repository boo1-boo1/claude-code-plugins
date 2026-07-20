# pytest

Python testing with pytest for Claude Code — runs the suite respecting the project's existing conventions.

## Usage

```
/python-test
/python-test tests/test_foo.py
/python-test -m "not slow"
```

Or just ask Claude to run tests / check coverage — the skill auto-triggers in projects with pytest config or `conftest.py`.

## Installation

```bash
pip install pytest
# or
pipx install pytest
```

## More Information
- [pytest documentation](https://docs.pytest.org/)
- [GitHub Repository](https://github.com/pytest-dev/pytest)
