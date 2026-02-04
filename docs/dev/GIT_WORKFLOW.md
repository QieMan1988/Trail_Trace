# Git Workflow & Branch Management Strategy

## 1. Branching Strategy

We adopt a simplified **Trunk-Based Development** workflow with `main` as the single source of truth.

### Core Branches
- **`main`**: The production-ready branch. All deployable code lives here. Direct commits are **prohibited** (except for repository initialization or critical hotfixes by maintainers).
- **`master`**: **DEPRECATED**. Do not use.

### Feature Branches
All development occurs in short-lived feature branches derived from `main`.

- **Naming Convention**:
  - Features: `feat/<module-name>/<short-description>` (e.g., `feat/player/movement-fsm`)
  - Bug Fixes: `fix/<issue-id-or-desc>` (e.g., `fix/collision-glitch`)
  - Documentation: `docs/<topic>` (e.g., `docs/git-workflow`)
  - Refactoring: `refactor/<scope>` (e.g., `refactor/inventory-system`)
  - Chores: `chore/<task>` (e.g., `chore/update-dependencies`)

## 2. Development Workflow

1.  **Sync**: Always pull the latest `main` before starting.
    ```bash
    git checkout main
    git pull origin main
    ```
2.  **Branch**: Create a new branch.
    ```bash
    git checkout -b feat/my-feature
    ```
3.  **Commit**: Write clear, atomic commits.
    - Format: `<type>(<scope>): <subject>`
    - Example: `feat(player): implement jump state logic`
4.  **Push**: Push to remote.
    ```bash
    git push -u origin feat/my-feature
    ```
5.  **Merge**: Open a Pull Request (PR) to `main`.
    - **Review**: At least 1 approval required (if team size permits).
    - **Checks**: CI/CD pipelines (Tests, Linting) must pass.
    - **Merge Method**: Squash and Merge (preferred to keep history linear).

## 3. Quality Gates

- **Code Style**: Must follow GDScript Style Guide.
- **Testing**: New logic must include GUT unit tests where applicable.
- **Assets**: Large binary assets (PSDs, high-res textures) should be excluded or managed via LFS (if configured). Use imported/compressed formats (.ctex, .stex) for repo efficiency.

## 4. Environment Security

- **`.env` Files**: Strictly ignored via `.gitignore`.
- **Secrets**: Never commit API keys, tokens, or passwords.
- **Template**: Use `.env.example` for sharing configuration structure without sensitive values.
