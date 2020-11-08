categories = Category.all
categories.each do |category|
  data = (0..(rand(20))).map do |_index|
    title = Faker::Educator.course_name
    {
      title: title,
      image_src: Faker::LoremFlickr.image(size: "300x200", search_terms: [title.split.first]),
      description: 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Nobis voluptate officiis rerum quisquam laudantium impedit autem repudiandae delectus dolore consequuntur ullam assumenda, in optio est laboriosam iusto atque! Possimus, nemo.',
      tags: [Faker::ProgrammingLanguage.name, Faker::Team.creature, Faker::Team.mascot]
    }
  end
  category.courses.create!(data)
end
