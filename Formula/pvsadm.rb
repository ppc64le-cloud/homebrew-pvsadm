class Pvsadm < Formula
  desc "Tool for managing the IBM Power Systems Virtual Servers"
  homepage "https://github.com/ppc64le-cloud/pvsadm"
  version "0.1.25"
  license "Apache-2.0"
  on_macos do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.25/pvsadm-darwin-amd64.tar.gz"
      sha256 "604dbcf907f2b6d58d6b8beea6984eb67d36ec9547d64028149f9d6f042cdbd3"
    end

    on_arm do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.25/pvsadm-darwin-arm64.tar.gz"
      sha256 "f9b5ce1c82b09b86bd26fb7d44a9f946d975cd622a72bb169c9a4c09d64071b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ppc64le-cloud/pvsadm/releases/download/v0.1.25/pvsadm-linux-amd64.tar.gz"
      sha256 "9fd38e3911ec44035f913c4a7db4bafde1cac68520f798d9c08479805ea22b31"
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
