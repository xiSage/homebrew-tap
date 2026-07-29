class HitokotoCli < Formula
  desc "从 hitokoto.cn 获取「一言」的命令行工具"
  homepage "https://github.com/xiSage/hitokoto-cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.2/hitokoto-osx-x64.tar.gz"
      sha256 "b28f9e4884f996a9cbaccd97881bc3682d669aa5ceb22f207b854d2a6298a368"
    elsif Hardware::CPU.arm?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.2/hitokoto-osx-arm64.tar.gz"
      sha256 "8d3f7962e435fc31be0724ea66aa93e4c33b0a2e8416c6cf679a578374d25ab3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.2/hitokoto-linux-x64.tar.gz"
      sha256 "f87e4e85c8f9df179f59ccf7de092182f66a70248aefa0acd92ec8eb76db27dc"
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.2/hitokoto-linux-arm64.tar.gz"
        sha256 "74751f5c8d7a2d2349fb5221833bc8f8c0cf6644a23421ed481da7da4ae3d4cd"
      else
        url "https://github.com/xiSage/hitokoto-cli/releases/download/v0.1.2/hitokoto-linux-arm.tar.gz"
        sha256 "df706ec6eb4fabc0a19d114daade0fd9dd8525c1fb2001763534ed6c554f2ce0"
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
