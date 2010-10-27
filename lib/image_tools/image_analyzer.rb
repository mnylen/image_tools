module ImageTools
  class ImageAnalyzer
    def self.analyze(file_name)
      width, height, mime_type = %x{exiftool -T -ImageWidth -ImageHeight -MimeType "#{file_name}"}.split
      
      {:width     => value_or(width, 0).to_i,
       :height    => value_or(height, 0).to_i,
       :mime_type => value_or(mime_type, "application/octet-stream")}
    end
    
    private
    
      def self.value_or(value, alternative)
        value == "-" ? alternative : value
      end
  end
end