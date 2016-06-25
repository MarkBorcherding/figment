require 'rainbow'

require 'figment/version'

# Figment of imaginations use rainbows
module Figment
  GRADIENT = %w(
    FF0000 FF0C00 FF1900 FF2600 FF3300 FF3F00 FF4C00 FF5900 FF6600 FF7300
    FE8100 FD8F00 FD9D00 FCAB00 FCB900 FBC700 FBD500 FAE300 FAF200 F9F300
    F8F400 F7F600 F6F700 F5F900 F4FA00 F3FC00 F2FD00 F2FF00 D7FF04 BCFF09
    A1FF0E 86FF13 6BFF17 50FF1C 35FF21 1AFF26 00FF2B 00FF40 00FF56 00FF6C
    00FF81 00FF97 00FFAD 00FFC2 00FFD8 00FFEE 00F7EF 00EFF1 00E7F3 00DFF5
    00D7F7 00CFF9 00C7FB 00BFFD 00B7FF 00A3FF 0090FF 007DFF 0069FF 0056FF
    0043FF 002FFF 001CFF 0009FF 0B07FF 1706FF 2305FF 2F04FF 3A03FF 4602FF
    5201FF 5E00FF 5C00FF 5B00FF 5A00FF 5900FF 5800FF 5700FF 5600FF 5500FF
  ).freeze

  def self.figment(s)
    colors = Figment::GRADIENT.dup
    colors += colors.reverse

    enumerator = case s.class
                 when String
                   s.split("\n")
                    .map { |l| "#{l}\n" }
                 else
                   s.each
                 end

    enumerator.each do |line|
      colors << colors.shift
      line_colors = colors.cycle
      line.chars.each { |c| print Rainbow(c).color line_colors.next }
    end
  end
end
