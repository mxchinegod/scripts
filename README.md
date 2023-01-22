![banner](banner.png)


<h1 align="center">

📄 scripts!

</h1>
<p align="center">
An engineering toolbox (just MacOS for now)
</p>

## ✨ Initialize

### 1️⃣
I start with 
[`macos/coldbrew.sh`](https://github.com/DylanAlloy/scripts/blob/main/macos/coldbrew.sh) which installs:

<table align="center">
<thead>
<tr>
<th style="text-align:left">📁 Software</th>
<th style="text-align:center">⚙ Purpose</th>
<th style="text-align:right">Optional</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left"><a href="https://brew.sh">brew</a></td>
<td style="text-align:center">Package Manager</td>
<td style="text-align:right">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://zsh.org">zsh</a></td>
<td style="text-align:center">Shell</td>
<td style="text-align:right">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://ohmyz.sh">oh-my-zsh</a></td>
<td style="text-align:center">Shell Config Manager</td>
<td style="text-align:right">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://iterm2.com">iterm2</a></td>
<td style="text-align:center">Terminal Emulator</td>
<td style="text-align:right">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://starship.rs/guide/">starship</a></td>
<td style="text-align:center">Terminal Theme</td>
<td style="text-align:right">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack">Hack Nerd Font</a></td>
<td style="text-align:center">Development Font</td>
<td style="text-align:right">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://git-scm.com">git</a></td>
<td style="text-align:center">Code Management</td>
<td style="text-align:right">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://www.raycast.com">raycast</a></td>
<td style="text-align:center">Spotlight Replacement</td>
<td style="text-align:right">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://github.com/dylanaraps/neofetch">neofetch</a></td>
<td style="text-align:center">Terminal Spec Viewer</td>
<td style="text-align:right">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://code.visualstudio.com">visual-studio-code</a></td>
<td style="text-align:center">IDE</td>
<td style="text-align:right">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://www.docker.com">docker</a></td>
<td style="text-align:center">Containerization</td>
<td style="text-align:right">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://kubernetes.io/docs/tasks/tools/">kubectl</a></td>
<td style="text-align:center">Kubernetes CLI</td>
<td style="text-align:right">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://k8slens.dev">Lens</a></td>
<td style="text-align:center">Kubernetes GUI</td>
<td style="text-align:right">❌</td>
</tr>
<tr>
<td style="text-align:left"><a href="https://www.notion.so">Notion</a></td>
<td style="text-align:center">Note-taking</td>
<td style="text-align:right">✅</td>
</tr>
</tbody>
</table>

</p>

### 2️⃣ 
The directory includes a .json 📝 document for manually importing into iTerm2 settings which will set terminal colors 🎨, window appearance 🪞, and font 📚 for you.

### 3️⃣
It will also add development-related apps on your MacOS Dock & restart it.

## ⚙️ Tools

😴

## ✅ To-Do

`README.md`
- [ ] Explain tools & scripts philosophy beyond installer

`/macos/coldbrew.sh`
- [x] Add Docker Desktop install
- [x] Add `kubectl` install
- [x] Add Lens install
- [x] Add Notion install
- [x] Add `git` install

`/kubernetes/`
- [ ] Document
- [ ] Protocolize