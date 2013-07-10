require 'formula'

class Qemu < Formula
  url 'http://wiki.qemu.org/download/qemu-1.0.tar.gz'
  homepage 'http://www.qemu.org/'
  md5 'a64b36067a191451323b0d34ebb44954'

  depends_on 'jpeg'
  depends_on 'gnutls'

  fails_with_llvm "Segmentation faults occur at run-time with LLVM"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--disable-darwin-user",
#                          "--enable-cocoa",
                          "--disable-bsd-user",
                          "--disable-guest-agent"
    system "make install"
  end
end
