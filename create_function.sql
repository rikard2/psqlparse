CREATE OR REPLACE FUNCTION cs_fmt_browser_version(v_name varchar,
                                                v_version varchar)
RETURNS void AS $$
DECLARE _omfg text = 'hej';
BEGIN
_omfg := 'asd';
  IF v_version IS NULL AND v_version = 'asd' THEN
      RETURN v_name;

      RAISE NOTICE 'asdasd';
  END IF;
  RETURN v_name || '/' || v_version;
END;
$$ LANGUAGE plpgsql;
GRANT ALL_PRIVILEGES ON cs_fmt_browser_version TO glue;
