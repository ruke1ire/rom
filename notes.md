# Notes for rom

### Markdown 

Viewing markdown files.

**1. Install grip**
```console
pip3 install grip

```

**2. Run grip**

```console
grip notes.md
```

**1. Install pandoc and some dependencies**
```console
sudo apt-get install pandoc texlive-latex-base texlive-fonts-recommended texlive-extra-utils texlive-latex-extra
```

**2. Convert to pdf**
```console
pandoc notes.md -o a.pdf
```

**3. Open file**
```console
evince a.pdf
```

