-- ============================================================
-- Roble Mueblería · Clase 5 · Base de conocimiento en Supabase
-- Pegar completo en Supabase → SQL Editor → Run (una sola vez)
-- ============================================================

-- 1) Activar la extensión de vectores
create extension if not exists vector;

-- 2) Tabla donde n8n guarda los fragmentos del manual
--    3072 = tamaño de los vectores de Gemini (gemini-embedding-001)
create table if not exists documents (
  id bigserial primary key,
  content text,          -- el texto del fragmento
  metadata jsonb,        -- datos extra (ej. fuente del documento)
  embedding vector(3072) -- el fragmento convertido en vector
);

-- 3) Función de búsqueda que usa n8n (Top K + Minimum Score)
create or replace function match_documents (
  query_embedding vector(3072),
  match_count int default null,   -- Top K: lo define n8n en la herramienta
  filter jsonb default '{}'
) returns table (
  id bigint,
  content text,
  metadata jsonb,
  similarity float
)
language plpgsql
as $$
#variable_conflict use_column
declare
  min_score float := 0.30;  -- MINIMUM SCORE: subilo o bajalo para calibrar (0 a 1)
begin
  return query
  select
    id,
    content,
    metadata,
    1 - (documents.embedding <=> query_embedding) as similarity
  from documents
  where metadata @> filter
    and 1 - (documents.embedding <=> query_embedding) >= min_score
  order by documents.embedding <=> query_embedding
  limit match_count;
end;
$$;

-- ============================================================
-- ÚTILES PARA LA CLASE (correr solo cuando haga falta)
-- ============================================================

-- Ver los fragmentos guardados (sirve para mostrar el chunking):
-- select id, left(content, 120) as inicio, metadata from documents order by id;

-- Actualizar el manual (gobernanza): vaciar la tabla y volver a subir el PDF
-- truncate table documents;
