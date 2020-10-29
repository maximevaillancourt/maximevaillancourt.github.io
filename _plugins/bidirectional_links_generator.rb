# frozen_string_literal: true

class BidirectionalLinksGenerator < Jekyll::Generator
  def generate(site)
    graph_nodes = []
    graph_edges = []

    notes = site.collections['notes'].docs

    notes.each do |current_note|
      # Nodes: Jekyll
      notes_linking_to_current_note = notes.filter do |e|
        e.content.include?(current_note.url)
      end

      # Nodes: Graph
      graph_nodes << {
        id: note_id_from_note(current_note),
        path: current_note.url,
        label: current_note.data['title']
      } unless current_note.path.include?('_notes/index.html')

      # Edges: Jekyll
      current_note.data['backlinks'] = notes_linking_to_current_note

      # Edges: Graph
      notes_linking_to_current_note.each do |n|
        graph_edges << {
          source: note_id_from_note(n),
          target: note_id_from_note(current_note),
        }
      end
    end

    File.write('_includes/notes_graph.json', JSON.dump({
      edges: graph_edges,
      nodes: graph_nodes,
    }))
  end

  def note_id_from_note(note)
    note.data['title']
      .dup
      .gsub(/\W+/, ' ')
      .delete(' ')
      .to_i(36)
      .to_s
  end
end
