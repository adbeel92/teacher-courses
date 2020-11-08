categories = Category.all
categories.each do |category|
  data = (0..(rand(20))).map do |_index|
    title = Faker::Educator.course_name
    image_uri = URI(Faker::LoremFlickr.image(size: "300x200", search_terms: [title.split.first]))
    res = Net::HTTP.get_response(image_uri)
    {
      title: title,
      image_src: "https://#{image_uri.host}#{res.response['location']}",
      description: 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nobis voluptate officiis rerum quisquam laudantium impedit autem repudiandae delectus dolore consequuntur ullam assumenda, in optio est laboriosam iusto atque! Possimus, nemo.',
      tags: [Faker::ProgrammingLanguage.name, Faker::Team.creature, Faker::Team.mascot]
    }
  end
  category.courses.create!(data)
end
