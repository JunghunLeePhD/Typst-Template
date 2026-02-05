# Collaborative Typst Template

A robust, pre-configured environment for writing modern mathematical papers using Typst, VS Code, and DevContainers.

## 🔗 The Architecture
This template relies on a pre-built Docker image to ensure zero setup time and offline capabilities.
- **Frontend (This Repo):** Your workspace for writing `.typ` files.
- **Backend ([Typst-Template-env](https://github.com/JunghunLeePhD/Typst-Template-env)):** The public container registry that provides the tools (Typst CLI, Typstyle, Tinymist).

---

## ✨ Features
- **⚡ Instant Startup:** Pulls the environment from GHCR. No 20-minute local Docker builds!
- **🔌 Offline Ready:** Critical VS Code extensions (Tinymist) are baked into the container, so it works even without Wi-Fi.
- **🤖 Auto-Compilation:** GitHub Actions builds your PDF on every push to any branch.
- **🛠 Built-in Tools:**
  - **VS Code:** Pre-configured with *Tinymist* (LSP, Autocomplete, Preview).
  - **Typstyle:** An opinionated formatter to keep your code clean (configured to run on save).
  - **GitGraph:** Visual interface for Git history.

## 📋 Prerequisites
You do **not** need to install Typst or Rust on your machine.

1. [Docker Desktop](https://www.docker.com/products/docker-desktop/) (Running in the background)
2. [Visual Studio Code](https://code.visualstudio.com/)
3. **Dev Containers Extension** (Search `ms-vscode-remote.remote-containers` in VS Code)

## 🚀 Getting Started

### 1. Create Your Project
1. Click the **[Use this template](https://github.com/JunghunLeePhD/Typst-Template/generate)** button above.
2. Create your new repository (Private or Public).
3. Open VS Code → Press `F1` → Select **Git: Clone** → Paste your new repo URL.

### 2. Enter the Environment
1. When you open the folder, a popup will appear: *"Folder contains a Dev Container configuration..."*
2. Click **Reopen in Container**.
3. *Wait:* It will download the pre-built image (~1 minute depending on internet speed).

### 3. Build the PDF
1. Open `main.typ`.
2. **Preview:** Click the "Preview" button (checked-page icon) in the top right to see live updates.
3. **Compile:** Simply save the file (`Ctrl+S`). The PDF is generated instantly.
4. **Formatting:** The code will automatically format on save. *Note: Add trailing commas to lists if you want them to stay vertical.*

---

## **⚙️ Customization**

### **Adding VS Code Extensions**
Modify `.devcontainer/devcontainer.json` and add the ID to `customizations.vscode.extensions`.

### **Adding System Tools**
If you need a tool installed at the OS level (like `python3` or `pandoc`), you cannot add it here.
You must update the [**Typst-Template-env**](https://github.com/JunghunLeePhD/Typst-Template-env) repository, which will then propagate to this template.

## **📂 Project Structure**

- `main.typ`: The skeleton file. Imports packages and includes sections.
- `sections/`: Write your chapters here.
- `references.bib`: Your bibliography file.
- `.github/workflows/`: CI automation scripts (Builds PDF on push).

---

## 🤝 Collaboration Workflow

We use a **Main-Production** strategy.
* **`main`**: The active working branch. All new features land here first.
* **`production`**: The "Gold Master". Only contains versions submitted to ArXiv/Journals.

### 1. Daily Routine (For Developers/Collaborators)

**Step 1: Start a Task**
Always branch from `main`.

```bash
git checkout main
git pull origin main
git checkout -b feature/lemma-proof
```

**Step 2: Work & Commit** Write your Typst code. Commit often.


```bash
git add .
git commit -m "Drafting Lemma 3"
```




**Step 3: Submit for Review** Push your branch and open a Pull Request (PR) targeting **`**main**`**.

```bash
git push origin feature/lemma-proof
```




- **GitHub Action** will automatically compile your PDF to check for errors.


- Assign **Labels** (e.g., `Content: Proof`, `Math: Needs Check`).


- Request a **Review** from a colleague.



**Step 4: Merge** Once approved and the build passes, merge the PR into `main`.

### **2. Releasing a Version (Manager Only)**

When the paper is ready for submission (e.g., ArXiv or a Journal):

1. **Merge to Production:** Create a Pull Request from `main` into `production`.

2. **Tag it:** After merging, switch to production and tag the specific commit.

```bash
git checkout production
git pull origin production
git tag v1.0-arxiv
git push origin v1.0-arxiv
```




## **📋 How to Use GitHub Projects (Task Management)**

We use **GitHub Projects** to track the progress of our paper. Think of it as our virtual whiteboard.

### **1. The Board Columns**

- **Todo:** Sections, proofs, or ideas that we need to write but haven't started yet.


- **In Progress:** Branches currently being worked on (e.g., "Alice is writing the Introduction").


- **Review:** Pull Requests that are finished and waiting for someone to read/check.


- **Done:** Merged into `main`.



### **2. Creating a Task (Issue)**

If you notice a gap in the logic or need a new section:

1. Go to the **Issues** tab.


2. Click **New Issue**.


3. Give it a clear title (e.g., *"Write proof for Theorem 2"* or *"Fix citation format"*).


4. (Optional) Assign it to yourself if you plan to do it immediately.



### **3. Linking Work to Tasks**

When you create a Pull Request, link it to the Issue so the board updates automatically.

- In your Pull Request description, type: `Closes #12` (where #12 is the issue number).


- GitHub will automatically move the card to **Done** when your code is merged.