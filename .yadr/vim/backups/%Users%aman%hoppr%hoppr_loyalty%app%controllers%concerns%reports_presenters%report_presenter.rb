Vim�UnDo�  t�q�2	���`Gg,�PErR���4�(൵   7   module ReportsPresenters                             RU��    _�                             ����                                                                                                                                                                                                                                                                                                                                                             RU��    �       :       �                   5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             RU��     �                  class VisitReportPresenter5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             RU��     �                
    public5�_�                    6       ����                                                                                                                                                                                                                                                                                                                                                             RU��     �   5   6            end5�_�                            ����                                                                                                                                                                                                                                                                                                                                       7           V        RU��    �   4   6              end�   3   5          �                  titleTextStyle: {color: 'green'}}, vAxis: {gridlines: {count: -1}, minValue: 1, title: 'Visit Count', titleTextStyle: {color: 'green'}, textStyle: {fontSize: 8}} }�   2   4          �                  :legend=> {position: "top"}, :width => 800, :height => 400, :title => 'Number of Visits', hAxis: {title: 'Hours', slantedTextAngle: 90, textStyle: {fontSize: 8},�   1   3          �      @options ||=  {pointSize: "5", gridlines: {color: '#333', count: 4}, tooltip: {textStyle: {color: '#0000ff'}, showColorCode: true},�   0   2              def options�   .   0              end�   -   /          `      @extra ||= {isStacked: true, :seriesType => 'bars', :series => {'2' => {:type => 'area'}}}�   ,   .              def extra�   *   ,              private�   (   *              end�   '   )          N      GoogleVisualr::Interactive::ComboChart.new(@graph, options.merge(extra))�   %   '          	      end�   $   &          F        return GoogleVisualr::Interactive::LineChart.new(@graph, opts)�   #   %          %        opts[:vAxis][:maxValue] = 100�   "   $          %        opts[:hAxis][:title] = "Date"�   !   #          4        opts[:vAxis][:title] = "% of Good Feedbacks"�       "                  opts = options�      !          '      if type == "line-chart-feedbacks"�                _      return GoogleVisualr::Interactive::LineChart.new(@graph, options) if type == "line-chart"�                '    def generate_graph type="bar-chart"�                    end�                      @graph.add_rows(row)�                    def fill_rows(row)�                    end�                    def fill_cell�                    end�                	      end�                7        @graph.set_cell(row_index, column_index, value)�                3      data.each_with_index do |value, column_index|�                %    def fill_cells row_index, data=[]�                    end�                	      end�                &        @graph.new_column(type, value)�   
                    cols.each do |type, value|�   	                 def columns cols={}�      	              end�                      @graph.add_rows(num)�                    def rows num�                    end�                +      @graph = GoogleVisualr::DataTable.new�                    def initialize5�_�                            ����                                                                                                                                                                                                                                                                                                                                       7           V        RU��    �          7      module ReportsPresenters5��