require date 

Class Item

def initialize(genre, author, source, label)
    @id = Random.rand(1...1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = date(day.month.year)
    @archived = false
end


