Vim�UnDo� ,�W��Tg�)�6�Q��SX�ME�uHjA�M�        end                             Q�K    _�                             ����                                                                                                                                                                                                                                                                                                                                                             Q�K     �                   5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Q�K     �               >  collections = out.scan(/\".+\"/).map { |s| s.gsub('"', '') }5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Q�K     �               "  collections.each do |collection|5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Q�K     �               r    system "mongoexport --db #{DB_NAME}  --collection #{collection}  --host '#{DB_HOST}' --out #{collection}_dump"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Q�K    �                   end5��