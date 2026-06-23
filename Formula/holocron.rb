# typed: false
# frozen_string_literal: true

# Holocron — declarative schema & query compiler.
class Holocron < Formula
  desc "Declarative schema & query compiler — YAML in, type-checked SQL out"
  homepage "https://github.com/holocron-lang/holocron"
  version "0.5.0"
  license "MPL-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holocron-lang/holocron/releases/download/v#{version}/holocron-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4dba19e9dbb980c0652ef5e7378c497e6220152dcd72be4b0cc5925506d4ce01"
    else
      url "https://github.com/holocron-lang/holocron/releases/download/v#{version}/holocron-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "785d85e1ff2d25f90f13e14c3f73e382066b45e8b4b6fb7863c8018be714a97c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/holocron-lang/holocron/releases/download/v#{version}/holocron-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "245977a0860529fda1d6fa7b86c572d42014ea8fa9403a4f3e74e4cd6a70b3d5"
    else
      url "https://github.com/holocron-lang/holocron/releases/download/v#{version}/holocron-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ffe69fe78506acaacd9bb67d9f36778593f164a7a1c5619cdfe180b1280d2c7"
    end
  end

  def install
    bin.install "holocron"
  end

  test do
    # `holocron --help` should print usage and exit 0.
    assert_match "Usage", shell_output("#{bin}/holocron --help")
  end
end