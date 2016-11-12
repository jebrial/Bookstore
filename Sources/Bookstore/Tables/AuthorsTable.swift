import SwiftKuery

final class AuthorsTable : Table {
    let name = "authors"

    let authorID = Column("author_id")
    let authorName = Column("name")
}