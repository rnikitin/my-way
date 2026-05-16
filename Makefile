.PHONY: test lint sync-check link-check agentlint

test: sync-check link-check

lint: link-check

sync-check:
	bash scripts/sync-check.sh

link-check:
	find . -name "*.md" -not -path "./.git/*" -print0 | while IFS= read -r -d "" file; do \
		npx -y markdown-link-check -c .markdown-link-check.json "$$file"; \
	done

agentlint:
	npx -y -p agentlint-ai agentlint check --project-dir . --format terminal

