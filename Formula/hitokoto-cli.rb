class HitokotoCli < Formula
  desc "从 hitokoto.cn 获取「一言」的命令行工具"
  homepage "https://github.com/xiSage/hitokoto-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.2.0/hitokoto-osx-x64.tar.gz"
      sha256 "3b9de16b06ebd5ff2a6d0fa9e51c2c54f92a0e7ea9bbf0cf842c089b97d548a4"
    elsif Hardware::CPU.arm?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.2.0/hitokoto-osx-arm64.tar.gz"
      sha256 "f6842a03b79c78c147c456b5facea130081c579eed949c230e38c39d79aaa7f1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.2.0/hitokoto-linux-x64.tar.gz"
      sha256 "8953f4cbb627bd904ce0fe0bedf7a41b51a1cc5f1760b0eac6848719af9fa6b2"
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.2.0/hitokoto-linux-arm64.tar.gz"
        sha256 "f5ddcdcba268787d12cded2b88cd50dfda84f23a7152aa53d691b331a232bf8e"
      else
        url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.2.0/hitokoto-linux-arm.tar.gz"
        sha256 "7132f295593d85c8016efca7fc2969f7be2da018efbd6bb9bc28765a2c553da9"
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
