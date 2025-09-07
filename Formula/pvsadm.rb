class Pvsadm < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  version "0.1.24"
  license "Apache-2.0"
  on_macos do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.24/pvsadm-darwin-amd64.tar.gz"
      sha256 "79b6f34a72a921f7d847a04bae0ac9743caa27bd720b6ae1fbf2956ed7e0f39f"
    end

    on_arm do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.24/pvsadm-darwin-arm64.tar.gz"
      sha256 "00fff4832efba48131840215af9107178e8b3de5c2c48ab6c64d3a680a693e30"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.24/pvsadm-linux-amd64.tar.gz"
      sha256 "3bb3e49e58bed66c3fc89329a1dfc6623262b22f7e4b62c66c835edfae7f3d22"
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
