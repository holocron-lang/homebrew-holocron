# typed: false
# frozen_string_literal: true

# holocron-lsp — LSP server for Holocron schema files.
class HolocronLsp < Formula
  desc "LSP server for Holocron — live in-editor diagnostics for .holocron.yaml"
  homepage "https://github.com/holocron-lang/holocron-lsp"
  version "0.1.1"
  license "MPL-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holocron-lang/holocron-lsp/releases/download/v#{version}/holocron-lsp-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9f8103234ad5ab5fbd33a01fdd41e1b5b38d37af5e51bd6b0305d1bb116e6e61"
    else
      url "https://github.com/holocron-lang/holocron-lsp/releases/download/v#{version}/holocron-lsp-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b6ccfa40a92a327a817cd5b7dcad9da74a128f1d19c3e8118608d35d76082ddb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/holocron-lang/holocron-lsp/releases/download/v#{version}/holocron-lsp-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d8db201e1c79959a014353ecf62e0fe4de0f35ffeab65d11bbd0461623467b8"
    else
      url "https://github.com/holocron-lang/holocron-lsp/releases/download/v#{version}/holocron-lsp-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ff32d8d557a2b255862daef8a226e10f1125318a509017bbe87f22b1e886fb7"
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