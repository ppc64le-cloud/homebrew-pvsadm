class Pvsadm < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  version "0.1.23"
  license "Apache-2.0"
  on_macos do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.23/pvsadm-darwin-amd64.tar.gz"
      sha256 "a3d722192d1f4334c255b537441488e1f374be78929e8815d2e3bc4266a7ca0f"
    end

    on_arm do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.23/pvsadm-darwin-arm64.tar.gz"
      sha256 "5a89bc9bcac112b55aa726820c5f0fd5e0fe3fc6d6966dc6f26f27ffb8efd3fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.23/pvsadm-linux-amd64.tar.gz"
      sha256 "27e02992ed53c37dfc01da1ee3ed7d14a8bd65b0e1d069883e9a3980da0e59bf"
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
