CREATE OR REPLACE FUNCTION insert_changelog()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO documents_changelog (document_id, old_data, new_data) 
  VALUES (CASE TG_OP
            WHEN 'DELETE' THEN OLD.id
            ELSE NEW.id
          END,
          OLD.data, 
          NEW.data);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER create_changelog_trigger
AFTER INSERT OR UPDTADE OR DELETE ON documents
FOR EACH ROW
EXECUTE PROCEDURE insert_changelog();
