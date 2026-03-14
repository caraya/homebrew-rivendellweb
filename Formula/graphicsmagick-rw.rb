class GraphicsmagickRw < Formula
  desc "Image processing tools collection"
  homepage "https://sourceforge.net/projects/graphicsmagick/"
  url "https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/1.3.46/GraphicsMagick-1.3.46.tar.xz"
  sha256 "c7c706a505e9c6c3764156bb94a0c9644d79131785df15a89c9f8721d1abd061"
  license "MIT"

  head "https://foss.heptapod.net/graphicsmagick/graphicsmagick/", using: :hg

  bottle do
    sha256 arm64_tahoe: "d3d473e997ace83740aa92f95fc27d600fd477ada887a1c7b8c84c900760be90"
  end

  depends_on "pkg-config" => :build
  depends_on "freetype"
  depends_on "jasper"
  depends_on "jpeg"
  depends_on "jpeg-turbo"
  depends_on "jpeg-xl"
  depends_on "libheif"
  depends_on "libpng"
  depends_on "libtiff"
  depends_on "libtool"
  depends_on "libzip"
  depends_on "little-cms2"
  depends_on "perl"
  depends_on "webp"
  depends_on "zstd"

  uses_from_macos "bzip2"
  uses_from_macos "libxml2"

  on_linux do
    depends_on "zlib-ng-compat"
  end

  conflicts_with "graphicsmagick", because: "both packages install the same binaries"

  skip_clean :la

  def install
    ENV["CFLAGS"]="-fPIC -DPIC"

    args = %W[
      --prefix=#{prefix}
      --disable-dependency-tracking
      --disable-openmp
      --disable-static
      --enable-shared
      --with-perl
      --with-modules
      --without-jbig
      --with-quantum-depth=16
      --without-lzma
      --without-x
      --without-gslib
      --with-gs-font-dir=#{HOMEBREW_PREFIX}/share/ghostscript/fonts
      --without-wmf
    ]

    # versioned stuff in main tree is pointless for us
    inreplace "configure", "${PACKAGE_NAME}-${PACKAGE_VERSION}", "${PACKAGE_NAME}"
    system "./configure", *args
    system "make", "install"
  end

  test do
    fixture = test_fixtures("test.png")
    assert_match "PNG 8x8+0+0", shell_output("#{bin}/gm identify #{fixture}")
  end
end
