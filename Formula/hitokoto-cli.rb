class HitokotoCli < Formula
  desc "从 hitokoto.cn 获取「一言」的命令行工具"
  homepage "https://github.com/xiSage/hitokoto-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.0/hitokoto-osx-x64.tar.gz"
      sha256 "d6c7618df632082cbcf8fed97532165d99f3bfd95551192842614ef44b915c66"
    elsif Hardware::CPU.arm?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.0/hitokoto-osx-arm64.tar.gz"
      sha256 "6c0b8981c41828c8271fac83b5a99791ee7c0df114e88c1090c6f6ad4ec046a0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.0/hitokoto-linux-x64.tar.gz"
      sha256 "c265ab870ead7c6b33c3380b7e1f2822d7b2df28d55351666f9c0c29140fd7bf"
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is-64-bit?
        url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.0/hitokoto-linux-arm64.tar.gz"
        sha256 "44d9bd650c3395a2d80a499197e5b56e37358f11f330fdd30c68fd0cf0a906d8"
      else
        url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.0/hitokoto-linux-arm.tar.gz"
        sha256 "b6b0bf032577fe891b8cbc2acfb963b5d0407eb2ca2e566b9d820412fb4e07ba"
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
