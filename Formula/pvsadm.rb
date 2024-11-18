class Pvsadm < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  version "0.1.20"
  license "Apache-2.0"
  on_macos do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.20/pvsadm-darwin-amd64.tar.gz"
      sha256 "84146a337e5de594e3fdc4d837e7359ad5aacdf15d226ca2f03904e7b9ea249c"
    end

    on_arm do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.20/pvsadm-darwin-arm64.tar.gz"
      sha256 "da0ffefdfb4e4a85807c0d8c23b0fc3753f62c124f273467a7ff15964ec4bdcb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.20/pvsadm-linux-amd64.tar.gz"
      sha256 "03f9d9787bad7db3785bd51fa4f9bc7bdfa21ecfdbbd00f372e0d9d74da5746b"
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
