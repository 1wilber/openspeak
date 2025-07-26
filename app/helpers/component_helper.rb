module ComponentHelper
  REGEX = /^_(.+)\.html\.erb$/

  Dir.entries(Rails.root.join("app/views/components")).each do |path|
    next if path.start_with?(".")

    match = path.match(REGEX)
    component_name = match[1]

    define_method("render_#{component_name}") do |locals|
      render partial: "components/#{component_name}", locals: locals
    end
  end
end
