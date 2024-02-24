class PklAT025 < Formula
  desc "Command-line interface for Pkl"
  homepage "https://github.com/apple/pkl"
  version "0.25.2"

  if Hardware::CPU.intel?
    url "https://github.com/apple/pkl/releases/download/0.25.2/pkl-macos-amd64"
    sha256 "6b9e478677697434e71f6b3119d0dde350a5f01b6a7df53bc69007421639e772"
  elsif Hardware::CPU.arm?
    url "https://github.com/apple/pkl/releases/download/0.25.2/pkl-macos-aarch64"
    sha256 "19a38559c3cbe23cdde245ce28e3f61afde7faefda4e4fbfcc2b908d5c412979"
  end

  def install
    if Hardware::CPU.intel?
      mv "pkl-macos-amd64", "pkl"
    elsif Hardware::CPU.arm?
      mv "pkl-macos-aarch64", "pkl"
    end
    bin.install "pkl"
  end

  test do
    system "#{bin}/pkl", "--version"
  end
end
