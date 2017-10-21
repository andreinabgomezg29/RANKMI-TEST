class Tree < ApplicationRecord
  has_ancestry

  validates :area, presence: true
  validates :score, presence: true
  after_commit :update_parent, on: [:create, :update]

  def self.as_json(options={}, hash=nil)
      hash ||= arrange(options)
      current_hast = []
      hash.each do |node, children|
        branch = {id: node.id, area: node.area, nota: node.score}
        branch[:childrens] = as_json(options, children) unless children.empty?
        current_hast << branch
      end
      current_hast
    rescue SomeError
      return []
  end

  def sibling_score
      siblings.pluck(:score).sum
    rescue SomeError
      return 0
  end

  def sibling_count
      siblings.count
    rescue SomeError
      return 1
  end

  private
    def update_parent(child=self)
      update_score(child)
    end

    def update_score(child)
      if child.has_parent?
        parent = child.parent
        if child.sibling_count > 0
          average = child.sibling_score / child.sibling_count
        else
          average = child.sibling_score
        end
        parent.update_columns(score: average)
        update_score(parent)
      end
    end
end
