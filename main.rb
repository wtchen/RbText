require 'tk'  
root = TkRoot.new do  
  title "Text Editor"  
  # the min size of window  
  minsize(400, 400)  
end  
textBox = TkText.new(root) do
  place('height' => 340, 'width' => 380, 'x' => 10, 'y' => 5)
end
TkLabel.new(root) do
  text "Save to: "
  place('height' => 15, 'width' => 75, 'x' => 10, 'y' => 355)
end
fileNameEntry = TkEntry.new(root) do
  place('height' => 15, 'width' => 305, 'x' => 85, 'y' => 355)
end
TkButton.new(root) do
  text "Save"
  place('height' => 15, 'width' => 100, 'x' => 10, 'y' => 380)
  command {save(fileNameEntry, textBox)}
end
def save(fileNameEntry, textBox)
  puts "Saving to: " + fileNameEntry.get() + "\n"
  puts "Text is: " + textBox.get(1.0, :end) + "\n"
  File.open(fileNameEntry.get(), "w+") do |f|
    f.write(textBox.get(1.0, :end))
  puts "Saved to: " + fileNameEntry.get()
end
end
Tk.mainloop  