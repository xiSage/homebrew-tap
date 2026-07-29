class HitokotoCli < Formula
  desc "从 hitokoto.cn 获取「一言」的命令行工具"
  homepage "https://github.com/xiSage/hitokoto-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.2/hitokoto-osx-x64.tar.gz"
      sha256 "a674dfdd001cb3a4891577dddaf2be997b4bf986b211afe65e7316ca7bf9dd93"
    elsif Hardware::CPU.arm?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.2/hitokoto-osx-arm64.tar.gz"
      sha256 "689c81c59bed1b68256511c71d6de04344564f7f0ed6d02987adfbc06c9c94b8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.2/hitokoto-linux-x64.tar.gz"
      sha256 "f2dda14b6fa197100541534a873cd531adc525fd7e22e53156e2dfa0c6381e3f"
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.2/hitokoto-linux-arm64.tar.gz"
        sha256 "230309702d777b9ce312e1fa424a8a6c0b516bc234fd72faa65c501d53ed2216"
      else
        url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.2/hitokoto-linux-arm.tar.gz"
        sha256 "48294c848f3debb27450339355b60a17b362eda29dfd18c89d190e37d90eb10a"
      end
    end
  end

  def install
    bin.install "hitokoto"
  end

  test do
    system "#{bin}/hitokoto", "--format", "text"
  end
end
