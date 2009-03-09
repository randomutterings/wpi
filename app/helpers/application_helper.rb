# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def remove_link_unless_new_record(fields)
    unless fields.object.new_record?
      out = ''
      out << fields.hidden_field(:_delete)
      out << link_to_function("remove", "$(this).up('.#{fields.object.class.name.underscore}').hide(); $(this).previous().value = '1'")
      out
    end
  end
  
  def add_record_link(form_builder, method, caption, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    options[:form_builder_local] ||= :f
    options[:insert] ||= method
    
    link_to_function(caption) do |page|
      form_builder.fields_for(method, options[:object], :child_index => 'NEW_RECORD') do |f|
        html = render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })
        page << %{
          $('#{options[:insert]}').insert({
            bottom: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime())
          });
        }
      end
    end
  end

end
