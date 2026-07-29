class HitokotoCli < Formula
  desc "从 hitokoto.cn 获取「一言」的命令行工具"
  homepage "https://github.com/xiSage/hitokoto-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.1/hitokoto-osx-x64.tar.gz"
      sha256 "d451842744b7e12428a3b7c7a35ad0932169f7ff22e0c29eb44c7407e9e0155e"
    elsif Hardware::CPU.arm?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.1/hitokoto-osx-arm64.tar.gz"
      sha256 "f91fc0262d0d63ced352b67a25ccbef000559da72eb9e80d4472c33abcc8aac5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.1/hitokoto-linux-x64.tar.gz"
      sha256 "85708233011954ee6e941db6c87964a5647c544e62f814505aaabf78d8e86f79"
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.1/hitokoto-linux-arm64.tar.gz"
        sha256 "21eb960f99f0c2882d29acd76cd4bb8ed7f88a186d8b6e3735ea394124c3ef44"
      else
        url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.1/hitokoto-linux-arm.tar.gz"
        sha256 "b8105bf3b7e8880956d737bc3bff2290c5089ba941fb1873e542fedc7f4820bc"
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
