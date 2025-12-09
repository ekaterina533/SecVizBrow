from pybtex.database import parse_string, BibliographyData, Entry

def entry_to_bibtex(entry_key, entry):
    """Генерация текста BibTeX-записи из pybtex Entry"""
    bib_data = BibliographyData(entries={entry_key: entry})
    return bib_data.to_string("bibtex")

def parse_bibtex(bibtex_content):
    """Парсинг содержимого BibTeX и возврат списка статей с полем raw_bib"""
    parsed_data = parse_string(bibtex_content, "bibtex")
    articles = []

    for key, entry in parsed_data.entries.items():
        raw_bib = entry_to_bibtex(key, entry)
        article = {
            "title": entry.fields.get("title", ""),
            "authors": "; ".join(str(author) for author in entry.persons.get("author", [])),
            "year": entry.fields.get("year", ""),
            "journal": entry.fields.get("journal", ""),
            "doi": entry.fields.get("doi", ""),
            "url": entry.fields.get("url", ""),
            "abstract": entry.fields.get("abstract", ""),
            "raw_bib": raw_bib
        }
        articles.append(article)

    return articles
