![banner](banner.png)

<h1 align="center">

📄 scripts!

</h1>
<p align="center">
An engineering toolbox (just MacOS for now)
</p>

# ✨ Usage

### 🚀 Initialize

#### 1️⃣ I start with [`macos/coldbrew.sh`](https://github.com/DylanAlloy/scripts/blob/main/macos/coldbrew.sh) which installs:

<table align="center">
<thead>
<tr>
<th style="text-align:left">📁 Software</th>
<th style="text-align:center">⚙ Purpose</th>
<th style="text-align:center">Optional</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left"><a href="https://brew.sh">brew</a></td>
<td style="text-align:center">Package Manager</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://zsh.org">zsh</a></td>
<td style="text-align:center">Shell</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://ohmyz.sh">oh-my-zsh</a></td>
<td style="text-align:center">Shell Config Manager</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://iterm2.com">iterm2</a></td>
<td style="text-align:center">Terminal Emulator</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://starship.rs/guide/">starship</a></td>
<td style="text-align:center">Terminal Theme</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack">Hack Nerd Font</a></td>
<td style="text-align:center">Development Font</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://git-scm.com">git</a></td>
<td style="text-align:center">Code Management</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://www.raycast.com">raycast</a></td>
<td style="text-align:center">Spotlight Replacement</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://github.com/dylanaraps/neofetch">neofetch</a></td>
<td style="text-align:center">Terminal Spec Viewer</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://code.visualstudio.com">visual-studio-code</a></td>
<td style="text-align:center">IDE</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://www.docker.com">docker</a></td>
<td style="text-align:center">Containerization</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://kubernetes.io/docs/tasks/tools/">kubectl</a></td>
<td style="text-align:center">Kubernetes CLI</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://k8slens.dev">Lens</a></td>
<td style="text-align:center">Kubernetes GUI</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://www.notion.so">Notion</a></td>
<td style="text-align:center">Note-taking</td>
<td style="text-align:center">✅</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://helm.sh">helm</a></td>
<td style="text-align:center">Kubernetes Chart manager</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://pre-commit.com">pre-commit</a></td>
<td style="text-align:center">pre-commit hook manager</td>
<td style="text-align:center">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://kompose.io">kompose</a></td>
<td style="text-align:center">docker to kubernetes conversion tool</td>
<td style="text-align:center">✅</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://github.com/aristocratos/btop">btop</a></td>
<td style="text-align:center">resource monitoring at CLI</td>
<td style="text-align:center">✅</td>
</tr>
</tbody>
</table>

</p>

#### 2️⃣ The directory includes a .json 📝 document for manually importing into iTerm2 settings which will set terminal colors 🎨, window appearance 🪞, and font 📚 for you.

<br/>

#### 3️⃣ It will also add development-related apps on your MacOS Dock & restart it.

<h5 align="center">
Now it's time to check out what tools you have to enhance your workflow instantly❣️

⬇️

</h5>

# ⚙️ Tools

<h3 id="-macos-"><code>macos/</code></h3>
<p align="center">
    ⚡️ <a href="https://github.com/DylanAlloy/scripts/blob/main/macos/wasm.sh"><code>wasm.sh</code></a>
        <code align="center">[]</code>
</p>
<p align="center"><sub>installs Emscripten for C++ → wasm compilation & makes sure cmake is available</sub></p>


<h3 id="-macos-"><code>sys/</code></h3>
<p align="center">
    📊 <a href="https://github.com/DylanAlloy/scripts/blob/main/sys/gpu_mingraph.sh"><code>gpu_mingraph.sh</code></a>
        <code align="center">["tiny"]</code>
</p>
<p align="center"><sub>100% native and low-memory terminal graphs for GPU util %, "tiny" as argument will make it even lower footprint</sub></p>


<h3 id="-kubernetes-"><code>kubernetes/</code></h3>
<p align="center">
    🖨️ <a href="https://github.com/DylanAlloy/scripts/blob/main/kubernetes/copy.sh"><code>copy.sh</code></a>
        <code align="center">[config] [namespace] [remote path] [local file] [pod]</code>
</p>
<p align="center"><sub>remote pod to local filesystem copy</sub></p>

<h3 id="-git-"><code>git/</code></h3>
<p align="center">
    🚀 <a href="https://github.com/DylanAlloy/scripts/blob/main/git/whatarmy.sh"><code>whatarmy.sh</code></a>
        <code align="center">[clone path] [repos.txt location]</code>
</p>
<p align="center"><sub>mass clone</sub></p>
<p align="center">
    🚀 <a href="https://github.com/DylanAlloy/scripts/blob/main/git/perfectionist.sh"><code>perfectionist.sh</code></a>
    <code align="center">[]</code>
</p>
<p align="center"><sub>auto-configure pre-commit and your git hooks using <a href="https://github.com/DylanAlloy/scripts/blob/main/git/perfectionist.txt"><code>perfectionist.txt</code></a></sub></p>
<p align="center">
    🚀 <a href="https://github.com/DylanAlloy/scripts/blob/main/git/pythode.sh"><code>pythode.sh</code></a>
    <code align="center">[]</code>
</p>
<p align="center"><sub>detect subfolders in the current directory & installs python/node dependencies automagically</sub></p>

<h3 id="-kubernetes-"><code>finance/</code></h3>
<p align="center">
    🗂️ <a href="https://github.com/DylanAlloy/scripts/blob/main/finance/pdf.sh"><code>pdf.sh</code></a>
        <code align="center">['fed' or a URL]</code>
</p>
<p align="center"><sub>scrapes all PDF links from a webpage</sub></p>
<h3 id="-design-"><code>design/</code></h3>
<p align="center">
    🏁 <a href="https://github.com/DylanAlloy/scripts/blob/main/design/spinners.sh"><code>spinners.sh</code></a>
     <code align="center">[]</code>
</p>
<p align="center"><sub>demonstrates animated spinners</sub></p>

# 🙋 Contributing

##### Proper commit message format is required for automated changelog generation. Examples:

    [<emoji>] [revert: ?]<type>[(scope)?]: <message>

    💥 feat(compiler): add 'comments' option
    🐛 fix(compiler): fix some bug
    📝 docs(compiler): add some docs
    🌷 UI(compiler): better styles
    🏰 chore(compiler): Made some changes to the scaffolding
    🌐 locale(compiler): Made a small contribution to internationalization

    Other commit types: refactor, perf, workflow, build, CI, typos, tests, types, wip, release, dep

# ✅ To-Do

`README.md`

- [ ] Explain tools & scripts philosophy beyond installer

`macos/coldbrew.sh`

- [x] Add Docker Desktop install
- [x] Add `kubectl` install
- [x] Add Lens install
- [x] Add Notion install
- [x] Add `git` install
- [x] Avoid Dock duplicates
- [x] Add `helm`
- [x] Add `pre-commit`

`kubernetes/`

- [x] Document
- [ ] Protocolize
