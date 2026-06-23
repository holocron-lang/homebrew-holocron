# typed: false
# frozen_string_literal: true

# Holocron — declarative schema & query compiler.
class Holocron < Formula
  desc "Declarative schema & query compiler — YAML in, type-checked SQL out"
  homepage "https://github.com/holocron-lang/holocron"
  version "0.4.0"
  license "MPL-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/holocron-lang/holocron/releases/download/v#{version}/holocron-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "6154a5cd50257a0ced868f4d1f36021a800f4bb80ceccbad7ed5cbabdd72d0fb"
    else
      url "https://github.com/holocron-lang/holocron/releases/download/v#{version}/holocron-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "063d4b52d600d64a3b0c65488655d57e49b5e7624f2c20ed56c5255b057dc44c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/holocron-lang/holocron/releases/download/v#{version}/holocron-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "092d6f91ffbeb6a608d261a6214e5ff337b4abf291caf0c431676c62472267f1"
    else
      url "https://github.com/holocron-lang/holocron/releases/download/v#{version}/holocron-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c9ce40d41dabc89329f80dc3b884da31ff3e848921877de78a72339bb362549"
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