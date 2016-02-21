module Note

    class NotesApplication
        def initialize(author)
            @author = author
            @notes = []
        end
        def create(notes_content)
            @notes.push(notes_content)
        end
        
        def list
            @notes.each do |i|
               puts "NOTE ID : #{@notes.index(i)+1}\n\n#{i}\n\nBy Author: #{@author}\n\n===============================\n\n"
           end
        end
    end
end