class Pvsadm < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  version "0.1.21"
  license "Apache-2.0"
  on_macos do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.21/pvsadm-darwin-amd64.tar.gz"
      sha256 "65915043ccd762233edaab84e5a8ca057be38e05929dc86a633006585ec71863"
    end

    on_arm do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.21/pvsadm-darwin-arm64.tar.gz"
      sha256 "227aca1c311952e6eb6447e1d34829828b340bfbfb70785e68ac06a216ece750"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.21/pvsadm-linux-amd64.tar.gz"
      sha256 "a4ebc4892835f54785da96968b68c58bff60aeba9e72473be4d497a2b2149249"
    end
  end

  def install
    bin.install "pvsadm"
  end

  test do
    output = shell_output("#{bin}/pvsadm get events 2>&1", 1)
    assert_match "Error: --instance-name or --instance-name required", output
    assert_match "Version: v#{version},", shell_output("#{bin}/pvsadm version |  awk '{print $1, $2}'")
  end
end
