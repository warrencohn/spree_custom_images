class InitImages < ActiveRecord::Migration
  def change
  end
  Dir.glob("public/images/*").each do |file|
    fformat = File.extname(file)
    fname = File.basename(file, fformat)
    Spree::CustomImage.create(:name => fname.downcase(), :format => fformat.downcase())
  end
end
