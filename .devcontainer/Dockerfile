FROM texlive/texlive:latest

# LilyPond (required by lyluatex's \lilypondfile), font tooling, Git,
# and inotify-tools (used to auto-rebuild when .ly files change, since
# LaTeX Workshop's own dependency watcher does not track \lilypondfile).
RUN apt-get update && apt-get install -y --no-install-recommends \
    lilypond \
    fontconfig \
    wget \
    ca-certificates \
    git \
    inotify-tools \
    && rm -rf /var/lib/apt/lists/*

# Sora font (used via \setmainfont{Sora} / fontspec)
# Installed system-wide so every contributor gets identical rendering.
RUN mkdir -p /usr/share/fonts/truetype/sora \
    && wget -q -O "/usr/share/fonts/truetype/sora/Sora-VariableFont_wght.ttf" \
      "https://raw.githubusercontent.com/google/fonts/main/ofl/sora/Sora%5Bwght%5D.ttf" \
    && fc-cache -f

# Non-root user matching the devcontainer default, with a persistent home
ARG USERNAME=vscode
RUN useradd -m -s /bin/bash ${USERNAME} || true

WORKDIR /workspace
