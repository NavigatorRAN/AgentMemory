# How to sign commits - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/guides/github/sign
- Final URL: https://docs.pi-hole.net/guides/github/sign/
- Canonical URL: https://docs.pi-hole.net/guides/github/sign/
- Fetched at: 2026-06-23T13:42:29Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
Signing Git Commits with SSH Keys ¶
Why Sign Commits? ¶
Signing commits provides:
Authentication : Proves the commit actually came from you
Integrity : Ensures the commit content hasn't been tampered with
Trust : GitHub displays a "Verified" badge for signed commits
Security : Protects against commit spoofing attacks
Prerequisites ¶
An SSH key pair (if you don't have one, generate with ssh-keygen -t ed25519 -C "your_email@example.com" )
SSH key added to your GitHub account
Setup Instructions ¶
1. Configure Git to Use SSH Signing ¶
# Set SSH as the signing format
git config --global gpg.format ssh
# Specify your SSH public key for signing
git config --global user.signingkey /PATH/TO/.SSH/KEY.PUB
# Optional: Enable automatic signing for all commits
git config --global commit.gpgsign true
2. Add SSH Key to GitHub ¶
Copy your SSH public key: /PATH/TO/.SSH/KEY.PUB
Go to GitHub → Settings → SSH and GPG keys
Click "New SSH key"
Set Key type to "Signing Key"
Paste your public key and save
3. Sign Commits ¶
# Sign a single commit
git commit -S -m "Your commit message" # If auto-signing is enabled, just commit normally
git commit -m "Your commit message"
Verification ¶
On GitHub: Look for the "Verified" badge next to your commits
Locally: git log --show-signature displays signature information
Notes ¶
SSH signing requires Git 2.34+ and GitHub support
Your SSH key must be added as a "Signing Key" type in GitHub, not just an authentication key
May 3, 2026
Back to top
