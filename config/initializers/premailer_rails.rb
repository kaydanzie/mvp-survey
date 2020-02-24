Premailer::Rails.config.merge!(preserve_styles: true, remove_ids: true,
  options: {
    input_encoding: 'UTF-8',
    generate_text_part: true,
    strategies: [:asset_pipeline]
  }
)
