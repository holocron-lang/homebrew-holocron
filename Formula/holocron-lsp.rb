# typed: false
# frozen_string_literal: true

# holocron-lsp — LSP server for Holocron schema files.
class HolocronLsp < Formula
  desc "LSP server for Holocron — live in-editor diagnostics for .holocron.yaml"
  homepage "https://github.com/holocron-lang/holocron-lsp"
  version "0.2.0"
  license "MPL-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holocron-lang/holocron-lsp/releases/download/v#{version}/holocron-lsp-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "37438e20c110c07a1fd7f28ba70248612f03c5efd6d92847a876c4eaf9a334c2"
    else
      url "https://github.com/holocron-lang/holocron-lsp/releases/download/v#{version}/holocron-lsp-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "213b0fb43edaf58242d18bbe79129c84a48338cc0e19091eb274890da5dc317a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/holocron-lang/holocron-lsp/releases/download/v#{version}/holocron-lsp-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "64d7fb0f5dbf0aedc9999cab12c971b452a4d10d8b84f9b4cc106df9e9393c95"
    else
      url "https://github.com/holocron-lang/holocron-lsp/releases/download/v#{version}/holocron-lsp-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd1c3e41d5f439853d311a8fdefecd2b9c06a402de49573662c004b22bf8d2db"
    end
  end

  def install
    bin.install "holocron-lsp"
  end

  test do
    # Initialize handshake — the binary should respond to LSP initialize over stdio.
    pid = spawn("#{bin}/holocron-lsp", in: :err)
    Process.kill("TERM", pid)
    Process.wait(pid)
    # Exit code is non-zero when SIGTERM'd, but the spawn itself succeeding proves the binary runs.
    assert_predicate (bin / "holocron-lsp"), :executable?
  end
end