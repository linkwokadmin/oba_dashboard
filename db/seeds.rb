# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.where(email: 'developer@linkwok.com').first_or_create(
                                              name: 'Cybit Admin',
                                              role: 'admin',
                                              password: '1linkwok@',
                                              password_confirmation: '1linkwok@'
)

Stream::STREAMS.each {|stream| Stream.where(name: stream).first_or_create}
Stream.where.not(name: Stream::STREAMS).destroy_all

Stage::STAGES.each {|stage| Stage.where(name: stage).first_or_create}
Stage.where.not(name: Stage::STAGES).destroy_all

Stage::REACTORS.each {|stage, reactors| reactors.each {|reactor| Reactor.where(label: reactor).first_or_create(stage: Stage.find_by(name: stage))}}
Reactor.where.not(label: Reactor::REACTORS).destroy_all

StreamReactor::STREAM_REACTORS.each {|stream, reactors| reactors.each {|reactor| StreamReactor.where(stream: Stream.find_by(name: stream), reactor: Reactor.find_by(label: reactor)).first_or_create}}