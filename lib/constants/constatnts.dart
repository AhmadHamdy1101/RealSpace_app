import 'package:projects/utils/constaints.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final core = Supabase.instance.client;
const supabaseUrl = 'https://calwjbkgqhvskqypgeso.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNhbHdqYmtncWh2c2txeXBnZXNvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk2MTUxODAsImV4cCI6MjA1NTE5MTE4MH0.Hbrsk4AjmtQFj-FjLhQ8rrlksUjWjnrR-Ty5QXdoU9c';

var CurrentUser = supabase.auth.currentUser;